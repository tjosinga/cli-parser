module CliParser
	extend self

	def parse(flags = [], options = [], cmd = nil)
		cmd = ARGV.map{ | x | x.index(/\s/) ? "\"#{x}\"" : x}.join(' ') if cmd.to_s.empty?
		result_args = []
		result_opts = {}

		keywords = %w("[^"]*" [^\s-][^\s]+)
		keywords << flags.collect { | f | Regexp.quote(f) }.join('|')
		keywords << options.collect { | o | Regexp.quote(o) + '\s+([^\s"]+|"[^"]*")+'  }.join('|')
		regex = Regexp.new('(' + keywords.compact.join('|') + ')')

		cmd.scan(regex).each { | a |
			if a[0].start_with?('-')
				k, v = a[0].split(' ', 2)
				v = true if flags.include?(k)
				v = v.to_s.gsub(/^\"/, '').sub(/\"$/, '') if options.include?(k)
				result_opts[k] = v
			else
				result_args.push(a[0])
			end
		}
		return [result_args, result_opts]
	end

end