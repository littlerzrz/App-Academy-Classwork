require 'byebug'
class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    
    # def inspect
    #     { 'value' => @value, 'parent_value' => @parent.value }.inspect 
    # end

    def parent=(node)
        #check if this self has an old parent before
        #if not set it to node directly
        #if yes, remove the self from the children of the old p
        #check if node has self as a children
        # idea => check if self.parenet.nil?; self.parent == node

        old_parent = self.parent 
        unless old_parent == node   
            @parent = node

            if node != nil 
                node.children << self 
            end

            if old_parent != nil 
                old_parent.children.delete(self)
            end        
        end
    end

    def add_child(child_node)
       child_node.parent=(self)
    end

    def remove_child(child_node)
        raise if !self.children.include?(child_node)
        child_node.parent=(nil)
    end

    def dfs(target_value)
        # debugger
        return self if self.value == target_value
        self.children.each do |child|
            search = child.dfs(target_value)
            return search unless search.nil?
        end
        nil
    end


    def bfs(target)
        queue = []
        queue << self
        
        until queue.empty?
                first = queue.shift
                return first if first.value == target
                queue.push(*first.children)
        end
        nil
    end

end



# queue.each do |node|
        #     return node if node == target
        # end

        # return nil if queue.nil?

# [1,2,3,4,5,6,8]
##go thru all nodes nodes.eacH?
## each .value == target?


# return self if self.value == target

# self.child each do |sub|
    # result = sub.dfs(target)
    # return result if result == target
# end
# nil
