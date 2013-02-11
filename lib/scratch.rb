class Menu
  include Enumerable

  def initialize(*args)
    @items = args
  end

  def each(&block)
    @items.each { |item| yield item }
  end
end
 YAML::dump
 File.write
