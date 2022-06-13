class CustomSet
  include Comparable

  def initialize(objects=[])
    @objects = objects.uniq
  end

  def <=>(other_set)
    objects.sort <=> other_set.objects.sort
  end

  def empty?
    objects.empty?
  end

  def contains?(obj)
    objects.include?(obj)
  end

  def subset?(other_set)
    objects.all? { |obj| other_set.contains?(obj) }
  end

  def disjoint?(other_set)  
    !objects.any? { |obj| other_set.contains?(obj) }
  end

  def eql?(other_set)
    self == other_set
  end

  def add(obj)
    objects.push(obj) unless contains?(obj)
    self
  end

  def intersection(other_set)
    new_objects = objects.select { |obj| other_set.contains?(obj) }
    CustomSet.new(new_objects)
  end

  def difference(other_set)
    new_objects = objects.reject { |obj| other_set.contains?(obj) }
    CustomSet.new(new_objects)
  end
  
  def union(other_set)
    new_objects = objects + other_set.objects
    CustomSet.new(new_objects)
  end

  protected

  attr_reader :objects
end