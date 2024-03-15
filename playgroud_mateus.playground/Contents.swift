struct StringStack{
    private var array = [String]()
    mutating func push(item:String) -> Void {
        self.array.append(item)
    }
    mutating func pop() -> String? {
        self.array.popLast()
    }
    var isEmpty: Bool {
        return self.array.isEmpty
    }
}
var stack = StringStack()
print(stack.isEmpty)
stack.push(item: "ola")
print (stack.isEmpty)
print(stack.pop())
