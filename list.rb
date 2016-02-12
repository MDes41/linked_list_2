require_relative 'node'


class List
  attr_reader :head

  def initialize(data)
    all_data_array = []
    all_data_array = data.split
    arrange_data_together(data)
    @head = @temp_head
  end

  def arrange_data_together(data)
    all_data_array = []
    all_data_array = data.split
    @temp_head = Node.new(all_data_array[0])
    counter = 0
    current = @temp_head
    until all_data_array[counter + 1] == nil
      current.next_node = Node.new(all_data_array[counter + 1])
      current = current.next_node
      counter += 1
    end
  end

  def find_the_end(list)
    current = list
    until current.next_node == nil
      current = current.next_node
    end
    current
  end

  def tail
    find_the_end(@head)
  end

  def append(data)
    arrange_data_together(data)
    tail.next_node = @temp_head
  end

  def gather_all_data(list)
    current = list
    all_data = []
    until current.next_node == nil
      all_data << current.data
      current = current.next_node
    end
    all_data.push(current.data)
    all_data.join(' ')
  end

  def all
    gather_all_data(@head)
  end

  def prepend(data)
    arrange_data_together(data)
    current = find_the_end(@temp_head)
    current.next_node = @head
    @head = @temp_head
  end

  def include?(data)
    all.split.include?(data)
  end

  def pop(number)
    current = @head
    cut_list_here = count - number - 1
    cut_list_here.times do
      current = current.next_node
    end
    @current_popped = current.next_node
    current.next_node = nil
    gather_all_data(@current_popped)
  end

  def count
    all.split.count
  end

  def insert(number, string)
    pop(number)
    current = find_the_end(@head)
    arrange_data_together(string)
    current.next_node = @temp_head
    current = find_the_end(@head)
    current.next_node = @current_popped
    gather_all_data(@head)
  end

  def find(location, number)
    pop_off = count - (location + number)
    temp_pop= pop(pop_off)
    temp_pop2 = pop(number)
    append(temp_pop)
    append(temp_pop2)
    gather_all_data(@current_popped)
  end
end
