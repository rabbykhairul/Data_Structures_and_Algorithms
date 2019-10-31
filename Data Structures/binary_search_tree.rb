
class BinaryTreeNode
    attr_accessor :value, :left_child, :right_child

    def initialize(value, left_child = nil, right_child = nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end

    def search_value(value)
        return true if self.value == value
        
        if value < self.value
            return false if self.left_child.nil?
            left_child.search_value(value)
        elsif value > self.value
            return false if self.right_child.nil?
            right_child.search_value(value)
        end
    end

    def add_child(child_node)
        if child_node.value < self.value
            add_child_to_the_left_side(child_node)
        elsif child_node.value > self.value
            add_child_to_the_right_side(child_node)
        end
    end

    def travarse
        left_child.travarse unless left_child.nil?
        print "#{value} "
        right_child.travarse unless right_child.nil?
    end

    def delete(value)
        if value < self.value
            delete_from_left_side(value)
        elsif value > self.value
            delete_from_right_side(value)
        end
    end

    private

    def delete_from_left_side(value)
        return if left_child.nil?

        if left_child.value == value
            self.left_child = left_child.successor_node
        else
            left_child.delete(value)
        end
    end

    def delete_from_right_side(value)
        return if right_child.nil?

        if right_child.value == value
            self.right_child = right_child.successor_node
        else
            right_child.delete(value)
        end
    end

    def add_child_to_the_left_side(child_node)
        if self.left_child == nil
            self.left_child = child_node
        else
            left_child.add_child(child_node)
        end
    end

    def add_child_to_the_right_side(child_node)
        if self.right_child == nil
            self.right_child = child_node
        else
            right_child.add_child(child_node)
        end
    end

    def find_the_least_greater_successor_child(node)
        left_child_of_the_node = node.left_child

        if left_child_of_the_node.has_no_child?
            node.left_child = nil
            return left_child_of_the_node
        elsif left_child_of_the_node.has_only_right_child?
            node.left_child = left_child_of_the_node.right_child
            return left_child_of_the_node
        else
            find_the_least_greater_successor_child(left_child_of_the_node)
        end
    end

    public

    def successor_node
        if has_no_child?
            return nil
        elsif has_only_left_child?
            return left_child
        elsif has_only_right_child?
            return right_child
        elsif has_both_left_and_right_child?
            return successor_node_from_among_the_childs
        end
    end

    def has_no_child?
        left_child.nil? && right_child.nil?
    end

    def has_only_left_child?
        left_child != nil && right_child == nil
    end

    def has_only_right_child?
        right_child != nil && left_child == nil
    end

    def has_both_left_and_right_child?
        left_child != nil && right_child != nil
    end

    def successor_node_from_among_the_childs
        if right_child.has_no_child? || right_child.has_only_right_child?
            right_child.left_child = left_child
            return right_child
        end

        successor_child = find_the_least_greater_successor_child(right_child)
        successor_child.left_child = left_child
        successor_child.right_child = right_child

        return successor_child
    end
end

class BinarySearchTree
    attr_accessor :root_node

    def initialize(root_node = nil)
        @root_node = root_node
    end

    def has_value?(value)
        root_node.search_value(value)
    end

    def insert(value)
        new_node = BinaryTreeNode.new(value)
        root_node.add_child(new_node)
    end

    def travarse
        root_node.travarse
        puts
    end

    def delete(value)
        if value == root_node.value
            delete_root_node
        else
            root_node.delete(value)
        end
    end

    def delete_root_node
        if self.root_node.has_only_left_child?
            self.root_node = self.root_node.left_child
        elsif self.root_node.has_only_right_child?
            self.root_node = self.root_node.right_child
        elsif self.root_node.has_both_left_and_right_child?
            self.root_node = self.root_node.successor_node_from_among_the_childs
        end
    end
end


# Test Case:
n1 = BinaryTreeNode.new(50)
bTree = BinarySearchTree.new(n1)

# Insertion
values = [ 25, 10, 75, 56, 33, 40, 30, 4, 11, 89, 82, 52, 61, 95 ]
values.each { |value| bTree.insert(value) }

# Searching
# p bTree.has_value?(89)
# p bTree.has_value?(100)

# Traverse / Reading
# bTree.travarse

# Deletion
bTree.travarse
bTree.delete(4)
bTree.travarse

bTree.delete(50)
bTree.travarse

bTree.delete(75)
bTree.travarse

bTree.delete(33)
bTree.travarse

bTree.delete(11)
bTree.travarse

bTree.delete(52)
bTree.travarse

bTree.delete(89)
bTree.travarse

bTree.delete(25)
bTree.travarse