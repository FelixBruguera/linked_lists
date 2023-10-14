class Linkedlist
    attr_accessor :size, :tail, :head
    
    @@size = 0
    @@tail = nil
    @@head = nil
    def initialize(type = "append")
    end
  
    def append(value)
      node = Node.new
      node.value(value)
      node
    end
    
    def prepend(value)
      node = Node.new("prepend")
      node.value(value)
      node
    end
    
    def size
      @@size
    end
  
    def head
      @@head.content
    end
    
    def tail
      @@tail.content
    end
  
    def at(index)
      pointer = 0
      return nil if index >= @@size
      content = @@head
      while pointer != index
        content = content.next_node
        pointer += 1
      end
      content
      end
    
    def pop
      previous = self.at(@@size -2)
      previous.instance_variable_set(:@next,nil)
      @@tail = previous
      @@size -= 1
    end
  
    def contains?(value)
      pointer = 0
      while pointer < @@size
        content = self.at(pointer).content
        if content == value then return true end
        pointer += 1
      end
      false
    end
  
    def find(value)
      pointer = 0
      while pointer < @@size
        content = self.at(pointer).content
        if content == value then return pointer end
        pointer += 1
      end
      nil
    end
  
    def to_s
      pointer = 0
      while pointer < @@size
        content = self.at(pointer)
        print "#{content.content} -> " unless content.nil?      
        pointer += 1
      end
    end
  
    def insert_at(value,index)
      if index > @@size+1 || index < 0 then return puts "Out of bounds" end
      if index == 0 then return self.prepend(value) end
      if index == @@size+1 then return self.append(value) end
      previous_node = self.at(index-1)
      next_node = self.at(index)
      node = Node.new('new')
      node.value(value)
      previous_node.instance_variable_set(:@next,node)
      node.instance_variable_set(:@next,next_node)
      @@size += 1
    end
  
    def remove_at(index)
      if index > @@size+1 || index < 0 then return puts "Out of bounds" end
      if index == 0 then return self.pop end
      previous_node = self.at(index-1)
      next_node = self.at(index+1)
      previous_node.instance_variable_set(:@next,next_node)
      self.at(index).instance_variable_set(:@next,nil)
      @@size -= 1
    end
    
  end
  
  class Node < Linkedlist
    attr_accessor :next, :content
    
    @next = nil
    @content = ""
    
    def initialize(type = "append")
      super
      @@size += 1
      if @@tail != nil && type == "append"
        @@tail.next = self
        @@tail = self
      elsif @@tail != nil && type == "prepend"
        @next = @@head
        @@head = self
      elsif type == 'new'
      else
        @@head = self
        @@tail = self
      end
    end
    
    def value(input = "")
      if input != ""
      @content = input
      end
      @content
    end
    def next_node
      @next
    end
  end
  
list = Linkedlist.new
node = list.append("First")
nod2 = list.append("Second")
list.append("Third")
first = list.prepend("New First")
p "Size before pop: #{list.size}"
list.pop
p "Size after pop: #{list.size}"
list.append("Fourth")
p list.contains?('Second')
p list.contains?('Sec')
p list.find('Fourth')
p list.find('Four')
p list.to_s
list.insert_at('Inserted',3)
p list.to_s
list.remove_at(3)
p list.to_s