class Category

  def initialize(parent)
    @parent = parent
  end

  def self.list(parent = "")
    letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
    letters = [parent[0]] if parent.present?
    category = Category.new(parent)
    result = []
    letters.each do |letter|
      result = result + category.items(letter)
    end
    result
  end

  def format_line(line)
    arr = line.titlecase.split("\t")
    arr[1].sub!("\n","")
    {arr[0] => arr[1]}
  end

  def tree(items)
    items
  end

  def tree2(items)
    new_items = []
    first_item = items.shift
    if @parent == false
      new_items << first_item
    else
      items.each do |item|
        new_items << item
      end
    end
    new_items
  end

  def flk(line)
    flk = format_line(line).keys[0]
  end

  # def formatted_line(line)

  def items(letter)
    items = []
    File.readlines("app/data/EN_ipc_section_#{letter}_title_list_20140101.txt").each do |line|
      next if items.length > 0 && @parent.length == 0

      if @parent.length == 1
        next if flk(line).length > 3
        next if flk(line).length < 2
        next unless flk(line).starts_with?(@parent)
      end

      if @parent.length == 3
        next if flk(line).length > 5
        next if flk(line).length < 4
        next unless flk(line).starts_with?(@parent)
      end

      if @parent.length > 3
        next if flk(line).length < 6
        next unless flk(line).starts_with?(@parent)
      end

      items << format_line(line)
    end
    tree(items)
  end
end
