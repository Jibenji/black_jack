class Bank
  attr_reader :name, :score, :account
  def initialize(params = {})
    @name = params[:bank_name] || "Bank"
    @score = 0
    @account = 10_000
  end
end
