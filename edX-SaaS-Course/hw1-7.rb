class CartesianProduct
    include Enumerable
    def initialize(arg1, arg2)
        @product = []
        arg1.each do |x|
            arg2.each { |v| @product << [x, v] }
        end
    end

    def each
        @product.each { |v| yield v }
    end
end

