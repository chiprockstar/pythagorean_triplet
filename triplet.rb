class Triplet

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where options = {}
    maxfac = options[:max_factor]
    minfac = options[:min_factor]
    sum = options[:sum]
    minfac.nil? ? minfac = 1 : minfac
    self.find_triplets(minfac, maxfac, sum)
  end

  private

  def self.find_triplets(minfac, maxfac, sum)
    triplets = []
    minfac.upto(maxfac) do |c|
      minfac.upto(c) do |b|
        minfac.upto(b) do |a|
        triplet = Triplet.new(a, b, c)
        triplets << triplet if triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
        end
      end
    end
    triplets
  end

end
