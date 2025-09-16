# Surge Ruby API library

The Surge Ruby library provides convenient access to the Surge REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/stainless-sdks/surge-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/surge).

The REST API documentation can be found on [docs.surge.app](https://docs.surge.app).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

```ruby
gem "surge", "~> 0.0.1"
```

## Usage

```ruby
require "bundler/setup"
require "surge"

surge = Surge::Client.new(
  api_key: ENV["SURGE_API_KEY"] # This is the default and can be omitted
)

message = surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td")

puts(message.id)
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Surge::Errors::APIError` will be thrown:

```ruby
begin
  message = surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td")
rescue Surge::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue Surge::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue Surge::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
surge = Surge::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
surge = Surge::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td", request_options: {timeout: 5})
```

On timeout, `Surge::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `Surge::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
message =
  surge.messages.create(
    "acct_01j9a43avnfqzbjfch6pygv1td",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(message[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `Surge::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `Surge::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td")
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td")

# You can also splat a full Params class:
params = Surge::MessageCreateParams.new
surge.messages.create("acct_01j9a43avnfqzbjfch6pygv1td", **params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :high
puts(Surge::CampaignParams::Volume::HIGH)

# Revealed type: `T.all(Surge::CampaignParams::Volume, Symbol)`
T.reveal_type(Surge::CampaignParams::Volume::HIGH)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
surge.campaigns.create(
  volume: Surge::CampaignParams::Volume::HIGH,
  # …
)

# Literal values are also permissible:
surge.campaigns.create(
  volume: :high,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/stainless-sdks/surge-ruby/tree/main/CONTRIBUTING.md).
