require 'test/unit'
require '../lib/cli-parser'

module CliParserTest

	class CliParserTest < Test::Unit::TestCase

		#noinspection RubyStringKeysInHashInspection
		def test_parse
			cmd = '-w arg1 -o Test arg2 -t "Hello World" arg3'

			args, options = CliParser.parse(%w(-w), %w(-o -t), cmd)
			assert_equal(%w(arg1 arg2 arg3), args)
			assert_equal({ '-w' => true, '-o' => 'Test', '-t' => 'Hello World' }, options)

			cmd = 'test1 test2 test3'
			args, options = CliParser.parse([], [], cmd)
			assert_equal(%w(test1 test2 test3), args)
			assert_equal({}, options)
		end

	end

end