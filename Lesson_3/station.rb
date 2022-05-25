class Station

  def initialize(name)
    @name = name
    @trainls = []
  end

  def train_in(train)
    @trainls << train unless @trainls.include?(train)
  end

  def train_out(train)
    @trainls.delete(train)
  end

  def train_list
    puts @trainls
  end

  def train_list_by_type(type)
    @trainls.count { |train| train.type == type }
  end
end