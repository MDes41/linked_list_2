require_relative 'list'

class JungleBeat
  attr_reader :list

  def initialize(data)
    @list = List.new(data)
  end

  def play
    `say -r 500 -v Boing "#{@list.all}"`
  end

  def append(data)
    beats_added = data.split.count
    @list.append(data)
    beats_added
  end

  def prepend(data)
    beats_added = data.split.count
    @list.prepend(data)
    beats_added
  end

  def all
    @list.all
  end

  def include?(data)
    @list.include?(data)
  end

  def pop(number)
    @list.pop(number)
  end

  def count
    @list.count
  end

  def insert(number, data)
    @list.insert(number, data)
  end

  def find(number, beats)
    @list.find(number, beats)
  end

end
