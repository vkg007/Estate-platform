class ContractJob < ApplicationJob
  queue_as :default

  def perform(contract_id)
    @contract_single = Contract.single_contract_detail(contract_id)
    UserMailer.contract_email(@contract_single).deliver_now
  end
end
