class Hash
  def deep_fetch(key, default = nil)
    keys = key.to_s.split('.')
    dig(*keys) || default rescue default
  end

  def dig(key, *args)
    value = self[key]
    return value if args.length == 0 || value.nil?
    value.dig(*args)
  end
end

class Array
  def deep_fetch(index, default = nil)
    indexes = index.to_s.split('.').map(&:to_i)
    dig(*indexes) || default rescue default
  end

  def dig(key, *args)
    value = self.at(key)
    return value if args.length == 0 || value.nil?
    value.dig(*args)
  end
end
