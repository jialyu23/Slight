module Slight
  class Configuration
    def initialize(options = {}, &blk)
      @options = options
      @options[:cus] ||= {}
      @options[:shortcutA] ||= {}
      @options[:shortcutT] ||= {}
      @options[:blinding] ||= {}
      @options[:before_filter] ||= []
      @options[:after_filter] ||= []
      blk.call self
      @options
    end

    def set(k, v); @options[:cus][k] = v; end
    def get(k); @options[:cus][k]; end
    def setIO(io_out);  @options[:io_out] = io_out; end
    def use(t, flag = :before)
      if flag == :before then
        @options[:before_filter].push(t)
      else
        @options[:after_filter].push(t)
      end
    end

    def shortcut(type, pattern, replacement)
      case(type)
      when :A
        @options[:shortcutA][pattern.to_sym] = replacement
      when :T
        @options[:shortcutT][pattern.to_sym] = replacement
      end
    end

    def blinding(*system_fun)
      @options[:blinding] = system_fun.map(&:to_sym)
    end
  end
end
