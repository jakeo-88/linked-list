class Node
    attr_accessor :value, :next_node
    
    def initialize(value = nil, next_node = nil)
       @value = value
       @next_node = next_node
    end
end


class LinkedList 
    
    def initialize(value) 
      @head = Node.new(value, nil)     
    end 
   
    def append(value)
      pointer = @head
      until pointer.next_node == nil do
        pointer = pointer.next_node
      end
      pointer.next_node = Node.new(value, nil)
    end
   
    def prepend(value)
      @head = Node.new(value, @head)
    end
    
    def size
       counter = 1
       pointer = @head
       until pointer.next_node == nil 
          pointer = pointer.next_node
          counter += 1
       end
       counter
    end
    
    def head
       pointer = @head
       return pointer.value
    end
    
    def tail 
       pointer = @head
       until pointer.next_node == nil do 
           pointer = pointer.next_node
       end 
       return pointer.value
    end
    
    def at_index(number)
        pointer = @head
        
        i = 0 
        while i < number do
          pointer = pointer.next_node
          i += 1
        end
        pointer.value
    end
    
    def pop
        ref = self.size - 2
        pointer = @head
        
        counter = 0
        until counter == ref do
           pointer = pointer.next_node 
           counter += 1
        end
        pointer.next_node = nil
    end

    def contains?(value, pointer = @head)
        
        return true if pointer.value == value
        return false if pointer.next_node == nil
        pointer = pointer.next_node
        
        contains?(value, pointer)   
    end
    
    def find(value, pointer = @head, index = 0)

        return index if pointer.value == value
        return nil if pointer.next_node == nil
        pointer = pointer.next_node
        
        find(value, pointer, index += 1)
    end
    
    def to_s(pointer = @head)
       return print "#{pointer.value} -> nil" if pointer.next_node == nil
       
       print "#{pointer.value} -> "
       
       pointer = pointer.next_node
       
       to_s(pointer)
    end
end
