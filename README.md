# Test Visualizer

This gem helps visualize your test architecture.

There are many recommend shapes of a test suite. Maybe you aspire toward a [Test Pyramid][pyramid]. Or a [Testing Trophy][trophy]. Or maybe you don't have many test at all, or any. That which gets measured improves.

### Install & Run

Install the gem with:

```
git clone https://github.com/jwworth/test-visualizer
cd test-visualizer
gem build test_visualizer.gemspec
gem install test_visualizer-0.0.1.gem
```

Then run:

```
test_visualizer viz
```

Sample output (pyramid-shaped):

```
Results:
--------

         **
        ****
********************

E2E tests (10)
Integration tests (20)
Unit tests (100)
```

Sample output (testing trophy):

```
Results:
--------

         *
********************
      ******

E2E tests (10)
Integration tests (120)
Unit tests (40)
```

The visualization scales for large test suites, so one asterisk does not
necessarily correlate to one test. Use the test counts below the visualization
to verify correctness.

### Test Libraries Supported

Currently supporting TestUnit, RSpec, and Cucumber tests.

### Assumptions

Your tests are all about the same size, no mega-tests. We currently aren't
counting individual specs, just files.

Your tests are in conventional locations for your test library. Unit tests in
test directories like "spec/models", E2E tests in directories like "features/",
etc.

### Run Tests

Test:

```
ruby test/test_test_visualizer.rb
```

[pyramid]: https://martinfowler.com/bliki/TestPyramid.html
[trophy]: https://kentcdodds.com/blog/the-testing-trophy-and-testing-classifications
