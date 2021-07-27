=begin
node has value, and pointer to left and right nodes
all data in left subtree is less than value in node
all data in right subtree is greater than value in node

.new takes a value and creates a central node
.data on new Bst returns value of central node

.insert should create a new node, compare it to existing nodes,
set left and right accordingly

.left should point to newly added node
.data is value in the left node

=end

class Bst1
  Node = Struct.new(:data, :left, :right)

  def initialize(data)
    @first_node = Node.new(data)
  end

  def data
    @first_node.data
  end

  def left
    @first_node.left
  end

  def right
    @first_node.right
  end

  # check if data <=> to data in first node
  # if <=
  #   if left node exists
  #     move into left node
  #   if left node nil
  #     create new node
  #     set new node data to data
  #     set left of prev node to new node
  # if >
  #   if right node exists
  #     move into right node
  #   if right node nil  
  #     create new node
  #     set new node data to data
  #     set right of prev node to new node
  def insert(value)
    current_node = insertion_traverse(value, @first_node)
    new_node = Node.new(value)
    if value <= current_node.data
      current_node.left = new_node
    else
      current_node.right = new_node
    end
  end

  def insertion_traverse(value, node)
    if value <= node.data
      if node.left
        insertion_traverse(value, node.left)
      else
        node
      end
    else
      if node.right
        insertion_traverse(value, node.right)
      else
        node
      end
    end
  end

  # start at beginning node
  # if node on left
  #   traverse to node
  # else
  #   this is the node with smallest value
  #   add value to collection

  # start at central node
  # if left node
  #   
  #   traverse left
  # else
  #   stop at this node, it is least value
  # yield value of current node
  # traverse to right

  def each
    return to_enum(:each) unless block_given?

    sort_nodes(@first_node).each { |elem| yield(elem.data) }
  end

  def sort_nodes(node)
    if node.left && node.right
      sort_nodes(node.left) + [node] + sort_nodes(node.right)
    elsif node.left && !node.right
      sort_nodes(node.left) + [node]
    elsif !node.left && node.right
      [node] + sort_nodes(node.right)
    else
      [node]
    end
  end
end

# best solution from Launchschool
class Bst2
  attr_reader :data, :left, :right
  
  def initialize(data)
    @data = data
  end

  def insert(value)
    if value > data
      right.nil? ? @right = Bst.new(value) : right.insert(value)
    else
      left.nil? ? @left = Bst.new(value) : left.insert(value)
    end
  end

  def each
    return to_enum unless block_given?

    left.each(&Proc.new) unless left.nil?
    yield(data)
    right.each(&Proc.new) unless right.nil?
  end
end