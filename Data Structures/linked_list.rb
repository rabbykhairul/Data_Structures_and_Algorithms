class Node
    attr_accessor :data, :next_node

    def initialize(data)
        @data = data
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :firstNode

    def initialize(firstNode = nil)
        @firstNode = firstNode
    end

    def read(index)
        current_index, current_node = 0, firstNode

        while current_index < index
            current_node = current_node.next_node
            current_index += 1

            return nil if current_node.nil?
        end

        current_node.data
    end

    def index_of(value)
        current_index, current_node = 0, firstNode

        until current_node.nil?
            return current_index if current_node.data == value
            current_node = current_node.next_node
            current_index += 1
        end

        nil
    end

    def insert_at_index(index, value)
        current_index, current_node = 0, firstNode

        while current_index < (index - 1)
            current_node = current_node.next_node
            current_index += 1

            if current_node.nil?
                raise "Invalid index for insertion"
                return
            end
        end

        node_to_be_inserted = Node.new(value)
        
        if index == 0
            node_to_be_inserted.next_node = firstNode
            self.firstNode = node_to_be_inserted
        else
            node_to_be_inserted.next_node = current_node.next_node
            current_node.next_node = node_to_be_inserted
        end
    end

    def delete_at_index(index)
        current_index, current_node = 0, firstNode

        if index == 0
            self.firstNode = firstNode.next_node
        end

        while current_index < (index - 1)
            current_node = current_node.next_node
            current_index += 1

            raise "Index #{index} doesn't exist yet." if current_node.nil?
        end

        node_to_delete = current_node.next_node
        node_pointed_by_the_node_to_be_deleted = node_to_delete.next_node
        current_node.next_node = node_pointed_by_the_node_to_be_deleted
    end
end


# Test Cases:
node1 = Node.new(50)
node2 = Node.new(32)
node3 = Node.new(67)
node4 = Node.new(88)
node5 = Node.new(29)

node1.next_node = node2
node2.next_node = node3
node3.next_node = node4
node4.next_node = node5

linked_list = LinkedList.new(node1)

# reading
# p "idx: 0, value: #{linked_list.read(0)}"
# p "idx: 1, value: #{linked_list.read(1)}"
# p "idx: 4, value: #{linked_list.read(4)}"
# p "idx: 10, value: #{linked_list.read(10)}"

# searching
# p "value: 25, index: #{linked_list.index_of(25)}"
# p "value: 29, index: #{linked_list.index_of(29)}"
# p "value: 32, index: #{linked_list.index_of(32)}"
# p "value: 50, index: #{linked_list.index_of(50)}"

# insertion
# p linked_list.read(0)
# linked_list.insert_at_index(0, 2)
# p linked_list.read(0)
# p linked_list.read(1)
# linked_list.insert_at_index(5, 30)
# p linked_list.read(5)
# linked_list.insert_at_index(2, 25)
# p linked_list.index_of(30)

# deletion
# p linked_list.index_of(29)
# puts "-----"
# p linked_list.index_of(67)
# puts "------"
# linked_list.delete_at_index(2)
# p linked_list.index_of(29)
# puts "-----"
# p linked_list.index_of(67)
# puts "------"
# p linked_list.index_of(50)
# p "------"
# linked_list.delete_at_index(0)
# p linked_list.index_of(50)
# p "------"
# p linked_list.firstNode