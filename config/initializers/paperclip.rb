Paperclip.interpolates :product_id do |attachment, style|
  attachment.instance.product_id
end

Paperclip.interpolates :style_id do |attachment, style|
  attachment.instance.id
end