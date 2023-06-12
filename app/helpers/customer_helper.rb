module CustomerHelper
  def human_presentation(customer)
    "#{customer.full_name.truncate(10)}(#{customer.cpf})"
  end
end
