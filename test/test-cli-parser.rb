require 'test/unit'
require '../lib/cli-parser'

module CliParserTest

	class CliParserTest < Test::Unit::TestCase

		#noinspection RubyStringKeysInHashInspection
		def test_parse

			cmd = 'test1 test2 test3'
			args, options = CliParser.parse([], [], cmd)
			assert_equal(%w(test1 test2 test3), args)
			assert_equal({}, options)


			cmd = '-w arg1 -o Test arg2 -t "Hello World" arg3'

			args, options = CliParser.parse(%w(-w), %w(-o -t), cmd)
			assert_equal(%w(arg1 arg2 arg3), args)
			assert_equal({ '-w' => true, '-o' => 'Test', '-t' => 'Hello World' }, options)

			args, options = CliParser.parse([], %w(-o -t), cmd)
			assert_equal(%w(arg1 arg2 arg3), args)
			assert_equal({'-o' => 'Test', '-t' => 'Hello World' }, options)

			args, options = CliParser.parse(%w(-w), [], cmd)
			assert_equal(['arg1', 'Test', 'arg2', '"Hello World"', 'arg3'], args)
			assert_equal({'-w' => true }, options)

			args, options = CliParser.parse([], [], cmd)
			assert_equal(['arg1', 'Test', 'arg2', '"Hello World"', 'arg3'], args)
			assert_equal({}, options)

		end

	end

end