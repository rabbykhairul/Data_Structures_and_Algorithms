class Node
    attr_accessor :value, :previous_node, :next_node

    def initialize(value)
        @value = value
        @previous_node = nil
        @next_node = nil
    end
end

class DoublyLinkedList
    attr_accessor :first_node, :last_node

    def initialize(first_node = nil, last_node = nil)
        @first_node = first_node
        @last_node = last_node
    end

    def insert_at_the_end(value)
        new_node = Node.new(value)

        if first_node.nil?
            self.first_node = new_node
            self.last_node = first_node
        else
            new_node.previous_node = last_node
            last_node.next_node = new_node
            self.last_node = new_node
        end
    end

    def remove_from_the_top
        return nil if first_node.nil?
        
        removed_node = first_node
        self.first_node = removed_node.next_node
        removed_node.value
    end
end

class Queue
    attr_reader :queue

    def initialize
        @queue = DoublyLinkedList.new
    end

    def enqueue(value)
        queue.insert_at_the_end(value)
    end

    def dequeue
        queue.remove_from_the_top
    end
end