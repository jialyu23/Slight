module Slight
  class Configuration

    def initialize(options = {}, &blk)
      @options = options
      @options[:cus] ||= {}
      blk.call self
      @options
    end

    def set(k, v)
      @options[:cus][K] = v
    end

    def use(t, flag = :before)
      @options[:before_filter] ||= []
      @options[:after_filter] ||= []
      if flag == :before then 
        @options[:before_filter].push(t)
      else
        @options[:after_filter].push(t)
      end
    end

    def use_after(t, d = '<')
      @options[:prep] ||= []
      d == '<' ? @options[:prep].push(t) : @options[:prep].unshift(t)
    end

    def shortcut(type, pattern, *replacement)
      case(type) 
      when :A
        @options[:shortcutA] ||= {}
        @options[:shortcutA][pattern.to_sym] = replacement
      when :T 
        @options[:shortcutT] ||= {}
        @options[:shortcutT][pattern.to_sym] = replacement
      end
    end

    def blinding(*system_fun)
      @options[:blinding] = system_fun.map(&:to_sym)
    end

  end
end