class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_reader attr_name
        attr_reader attr_name + "_history"

        setter = "def #{attr_name}=(value)
                    if !@#{attr_name}_history
                        then @#{attr_name}_history = [nil]
                    end
                    @#{attr_name} = value
                    @#{attr_name}_history << value
                  end"
        class_eval(setter)
    end
end

class Foo
    attr_accessor_with_history :bar
end
