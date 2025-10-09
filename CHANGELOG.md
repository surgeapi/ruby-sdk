# Changelog

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
