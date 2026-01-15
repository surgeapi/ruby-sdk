# Changelog

## 0.5.0 (2026-01-15)

Full Changelog: [v0.4.0...v0.5.0](https://github.com/surgeapi/ruby-sdk/compare/v0.4.0...v0.5.0)

### Features

* **api:** add delete user endpoint ([424ea71](https://github.com/surgeapi/ruby-sdk/commit/424ea7107c3039b175ccdc6066d04dec9d094dfd))

## 0.4.0 (2026-01-10)

Full Changelog: [v0.3.0...v0.4.0](https://github.com/surgeapi/ruby-sdk/compare/v0.3.0...v0.4.0)

### Features

* **api:** add archive account endpoint ([b56a3ac](https://github.com/surgeapi/ruby-sdk/commit/b56a3ac799df5e73cfea5416bb6af32cdeaac64d))


### Bug Fixes

* issue where json.parse errors when receiving HTTP 204 with nobody ([a54e6ff](https://github.com/surgeapi/ruby-sdk/commit/a54e6ff310c9d5d146161a33971eb0dc541c9774))


### Chores

* **internal:** codegen related update ([6dda266](https://github.com/surgeapi/ruby-sdk/commit/6dda2669de3018139c1ff15a9c23edda513fd899))
* move `cgi` into dependencies for ruby 4 ([03ce06b](https://github.com/surgeapi/ruby-sdk/commit/03ce06b6a4f4d7f510dee6ece06e89ff93ede89d))

## 0.3.0 (2025-12-17)

Full Changelog: [v0.2.1...v0.3.0](https://github.com/surgeapi/ruby-sdk/compare/v0.2.1...v0.3.0)

### Features

* **api:** add retrieve message endpoint ([55df346](https://github.com/surgeapi/ruby-sdk/commit/55df346f91c99fece77d130057afc55b021666c7))


### Bug Fixes

* better thread safety via early initializing SSL store during HTTP client creation ([0d14e5e](https://github.com/surgeapi/ruby-sdk/commit/0d14e5e73496e95743359c4c8dbab6da1c384a6e))
* calling `break` out of streams should be instantaneous ([b43c7e5](https://github.com/surgeapi/ruby-sdk/commit/b43c7e54e9dfaaf31ffa0fe498c53fcc51bbb81c))


### Chores

* bump dependency version and update sorbet types ([e00a588](https://github.com/surgeapi/ruby-sdk/commit/e00a5886df58170099838c7a2b1ba25fe36588d6))
* explicitly require "base64" gem ([a25ee53](https://github.com/surgeapi/ruby-sdk/commit/a25ee53f821df6c2d177b0e41c864e15e4b8bae9))
* **internal:** codegen related update ([744a068](https://github.com/surgeapi/ruby-sdk/commit/744a0682fa04890d445106232878d0d5be7d7273))

## 0.2.1 (2025-10-31)

Full Changelog: [v0.2.0...v0.2.1](https://github.com/surgeapi/ruby-sdk/compare/v0.2.0...v0.2.1)

### Features

* **api:** create externally registered campaigns ([c01b26e](https://github.com/surgeapi/ruby-sdk/commit/c01b26e3f26a8b827254d128a7c776d79850cbf5))
* handle thread interrupts in the core HTTP client ([4362499](https://github.com/surgeapi/ruby-sdk/commit/43624993a62c67679d1f5260653517aebd5d687e))


### Bug Fixes

* absolutely qualified uris should always override the default ([58fa7be](https://github.com/surgeapi/ruby-sdk/commit/58fa7bea703edecd59fe69630191a9cb83ece9d0))
* should not reuse buffers for `IO.copy_stream` interop ([52ce0fd](https://github.com/surgeapi/ruby-sdk/commit/52ce0fd6a7039be032e2f884636215ac1fb88223))


### Documentation

* **api:** add context around organization contacts ([88c764d](https://github.com/surgeapi/ruby-sdk/commit/88c764d18d70361d1a7f43e22a46d26082f24227))

## 0.2.0 (2025-10-09)

Full Changelog: [v0.1.0...v0.2.0](https://github.com/surgeapi/ruby-sdk/compare/v0.1.0...v0.2.0)

### Features

* **api:** api update ([8a7eeeb](https://github.com/surgeapi/ruby-sdk/commit/8a7eeeb4c5248d0f0aa4da399c45d2763b98ba3b))


### Bug Fixes

* always send `filename=...` for multipart requests where a file is expected ([28bdedf](https://github.com/surgeapi/ruby-sdk/commit/28bdedfba8e9bef43abf39e08169bc2bf2edb0e8))
* coroutine leaks from connection pool ([239043f](https://github.com/surgeapi/ruby-sdk/commit/239043f74e12856fb8e6b2a477ea9bf35945f2f2))


### Chores

* ignore linter error for tests having large collections ([4d89802](https://github.com/surgeapi/ruby-sdk/commit/4d898024ffae04e4f24591b1c54a922e1b6c51f4))

## 0.1.0 (2025-09-26)

Full Changelog: [v0.0.1...v0.1.0](https://github.com/surgeapi/ruby-sdk/compare/v0.0.1...v0.1.0)

### Features

* **api:** add ruby and change python package name ([d770df8](https://github.com/surgeapi/ruby-sdk/commit/d770df89ffb02a0a7555fa90a5c943b54547f620))
* **api:** api update ([0c2d323](https://github.com/surgeapi/ruby-sdk/commit/0c2d3235047d5dfce44bc923b049950c4957854d))
* **api:** ignore phone-number string format error ([bffdc29](https://github.com/surgeapi/ruby-sdk/commit/bffdc29d31f717392acce96b505ba6a3de744811))
* **api:** manual updates ([a8e1b08](https://github.com/surgeapi/ruby-sdk/commit/a8e1b08ab8829c4e1028d539eb1535109863810d))
* **api:** manual updates ([da2aa08](https://github.com/surgeapi/ruby-sdk/commit/da2aa08c75571cc01019d23c60725e379eb01202))
* expose response headers for both streams and errors ([21bbb9e](https://github.com/surgeapi/ruby-sdk/commit/21bbb9e80873a5fe04e2436938a6a56e52ef4873))
* **types:** remove explicit params types ([c43f650](https://github.com/surgeapi/ruby-sdk/commit/c43f650cfe2a3c0ab05231d7f2db15cf3f108b81))
* **types:** try removing account_update_params type ([9a7763f](https://github.com/surgeapi/ruby-sdk/commit/9a7763f376cc5394cdc976b1929164ba6c354076))


### Performance Improvements

* faster code formatting ([1559ebc](https://github.com/surgeapi/ruby-sdk/commit/1559ebc7333dcadb7f1aa94666a237fa0f4204f6))


### Chores

* configure new SDK language ([0a9942a](https://github.com/surgeapi/ruby-sdk/commit/0a9942a34e0f7637985937fed36cced872a432e6))
* do not install brew dependencies in ./scripts/bootstrap by default ([fdb4bd7](https://github.com/surgeapi/ruby-sdk/commit/fdb4bd7238eaeb5bd5a18a21a158d02cd9d6bc52))
* update SDK settings ([bc95cd0](https://github.com/surgeapi/ruby-sdk/commit/bc95cd0533c84d203ca12c4dde56394524036ef0))
