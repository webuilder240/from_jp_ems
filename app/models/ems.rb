class Ems
  include ActiveModel::Model
  attr_accessor :area, :weight
  ALLOW_AREAS = JpEmsFee.singleton_methods.map(&:to_s)
  validates :area, inclusion: { in: ALLOW_AREAS }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30000 }

  def weight=(value)
    begin
      value = Integer(value)
    rescue TypeError, ArgumentError
      value = 0
    end
    @weight = value
  end

  def amount
    JpEmsFee.send(area, weight)
  end

  def render_error_response
    {
      'result': 500,
      'error': errors.full_messages
    }
  end

  def render_response
    {
      'result': 200,
      'area': area,
      'weight': weight,
      'amount': amount,
    }
  end
end
