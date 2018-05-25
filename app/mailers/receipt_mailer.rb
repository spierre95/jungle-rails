class ReceiptMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_mailer.order_receipt.subject
  #
  def email_receipt(order_email, line_items)

    @line_items = line_items

    mail(to: order_email, subject:"Jungle Receipt Order # #{@line_items[0].order.id}")
  end
end
