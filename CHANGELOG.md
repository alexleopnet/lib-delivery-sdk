# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.5.1 - 2026-11-27
- Added PHP 8.4 and PHP 8.5 support: `Collection::get()`, `Container::set()`, `DeliveryLoggerInterface::error()` and the `$previous` parameter of `CredentialsValidationException`, `DeliveryOrderRequestException` and `RateLimitExceededException` are now explicitly nullable, which removes the deprecation notices
- Fixed tests that failed on newer PHP versions: `DeliveryOrderCallbackServiceTest` no longer creates a dynamic property (deprecated since PHP 8.2), and `MerchantClientProviderTest` calls `ReflectionProperty::setAccessible()` only before PHP 8.1 (deprecated since PHP 8.5)
- Added PHP 8.4 and PHP 8.5 to the CI test matrix, quoted the PHP versions so the `8.0` job runs on PHP 8.0, and turned off fail-fast so one failing job does not cancel the others
- Raised the minimum `mockery/mockery` dev dependency to `^1.6.12`, the first release whose mocks are PHP 8.4 compatible
- Tests run with `error_reporting=-1` (set in `phpunit.xml`), so a PHP deprecation notice fails the test suite even though the CI Docker image hides deprecations in its php.ini

## 0.5.0 - 2026-05-05
- Single-shipment-per-order now uses merchant default parcel size from settings instead of summing item dimensions
- Added `getDefaultParcelWidth/Height/Length/Weight` to `PayseraDeliverySettingsInterface`
- `ShipmentsAdapter::convert()` signature changed: now accepts `PayseraDeliverySettingsInterface` instead of a bool flag

## 0.4.0 - 2026-02-18
- Add credentials validation feature

## 0.3.0 - 2024-06-15
- Sending as one big package

## 0.2.1 - 2024-04-29
- Updated documentation

## 0.2.0 - 2024-04-01
- Added support for test mode delivery orders

## 0.1.3 - 2025-01-21
- Updated webtopay/libwebtopay to ^3.1

## 0.1.2 - 2025-01-09
- Added support for prepaid order status

## 0.1.1 - 2024-11-15
- A bunch of small fixes and optimizations

## 0.1.0 - 2024-10-23
- Generated library from RAML
