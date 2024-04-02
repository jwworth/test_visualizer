require 'minitest/autorun'
load 'lib/test_visualizer.rb'

class TestTestVisualizer < Minitest::Test
  def test_viz
    result = <<~RESULT
      Results:
      --------

          ***
           *
      ***********

      E2E tests (3)
      Integration tests (1)
      Unit tests (11)
    RESULT

    assert_equal result, TestVisualizer.new.invoke(:viz)
  end

  def test_printing_larger_numbers
    result = <<~RESULT
      Results:
      --------

               **
              ****
      ********************

      E2E tests (10)
      Integration tests (20)
      Unit tests (100)
    RESULT

    assert_equal result, TestVisualizer.new.invoke(:print_results, [10, 20, 100])
  end
end
