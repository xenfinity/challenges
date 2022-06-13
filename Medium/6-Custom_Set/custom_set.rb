class CustomSet
  include Comparable
  attr_reader :objects

  def initialize(objects=[])
    @objects = objects
  end

  def <=>(other_set)
    objects.uniq.sort <=> other_set.objects.uniq.sort
  end

  def empty?
    objects.empty?
  end

  def contains?(obj)
    objects.include?(obj)
  end

  def subset?(other_set)
    objects.all? { |obj| other_set.objects.include?(obj) }
  end

  def disjoint?(other_set)  
    !objects.any? { |obj| other_set.objects.include?(obj) }
  end

  def eql?(other_set)
    self == other_set
  end

  def add(obj)
    objects.push(obj)
    self
  end

  def intersection(other_set)
    new_objects = objects.select { |obj| other_set.objects.include?(obj) }
    CustomSet.new(new_objects)
  end

  def difference(other_set)
    new_objects = objects.reject { |obj| other_set.objects.include?(obj) }
    CustomSet.new(new_objects)
  end
  
  def union(other_set)
    new_objects = objects + other_set.objects
    CustomSet.new(new_objects.uniq)
  end
end