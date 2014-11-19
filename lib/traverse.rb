class Node
  attr_reader :data, :left_child, :right_child

  def initialize(data, left, right)
    @data = data
    @left_child = left
    @right_child = right
  end
end

class Traverse

  def self.capture(data)
    puts "Captured: #{data}"
  end

  def self.root_only(tree)
    capture(tree.data)
  end

  def self.with_preorder(node)
    capture(node.data)
    Traverse.with_preorder(node.left_child) unless node.left_child.nil?
    Traverse.with_preorder(node.right_child) unless node.right_child.nil?
  end

  def self.with_inorder(node)
    Traverse.with_inorder(node.left_child) unless node.left_child.nil?
    capture(node.data)
    Traverse.with_inorder(node.right_child) unless node.right_child.nil?
  end

  def self.with_postorder(node)
    Traverse.with_postorder(node.left_child) unless node.left_child.nil?
    Traverse.with_postorder(node.right_child) unless node.right_child.nil?
    capture(node.data)
  end

  def self.with_levelorder(node)
    counter = 0
    array_of_nodes = [[node]]
    until array_of_nodes[counter].empty? do
      # all?(&:nil?) do 
      holder = []
      array_of_nodes[counter].each do |particular_node|
        holder << particular_node.left_child unless particular_node.left_child.nil?
        holder << particular_node.right_child unless particular_node.right_child.nil?
      end
      counter += 1
      array_of_nodes << holder
    end
    
    array_of_nodes.flatten.each {|each_node| capture(each_node.data)}
  end
end

