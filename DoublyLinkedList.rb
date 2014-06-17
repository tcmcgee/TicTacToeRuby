class DoublyLinkedList
    attr_accessor :head, :tail
    
    def prepend(value)
        if head.nil?
            head = Node.new(value, nil, nil)
            tail = head
        else
            previous_head = head
            head = Node.new(value, nil, previous_head)
            previous_head.previous_node = head
        end
    end
    
    def append(value)
        if tail.nil?
            tail = Node.new(value, nil, nil)
            head = tail
        else
            previous_tail = tail  
            tail = Node.new(value, previous_tail, nil)
            previous_tail.next_node = tail
        end
    end
    
    def print_out_all_nodes
        if head.nil?
            puts "empty"
            return
        end
        
        current_node = head
        until current_node.tail.nil?
            puts current_node.value
            current_node = current_node.tail
        end
        
        puts current_node.value
    end
    
#    def nth_node_from_beginning(n)
#        return nil if head.nil?
#        current_node = head
#        iterations = n
#        while iterations > 0
#            current_node = current_node.next_node
#            iterations -= 1
#        end
#        current_node
#    end
end 

class Node
    attr_accessor :value, :previous_node, :next_node 
    
    def initialize(value, previous_node, next_node)
      @value = value
      @previous_node = previous_node
      @next_node = next_node
    end
end

doubly_linked_list = DoublyLinkedList.new
doubly_linked_list.prepend 5
doubly_linked_list.append 10
doubly_linked_list.append 23
doubly_linked_list.append 30
doubly_linked_list.print_out_all_nodes