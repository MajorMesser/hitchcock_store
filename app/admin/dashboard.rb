ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    table do
      thead do
        tr do
          td do
            'Order ID'
          end
          td do
            'Customer Name'
          end
          td do
            'E-Mail'
          end
          td do
            'Province'
          end
          td do
            'Sub-Total'
          end
          td do
            'Grand Total'
          end
        end
      end
      tbody do
        Order.where("status = 'pending'").each do |order|
          tr do
            td do
              link_to order.id, admin_order_path(:id => order.id)
            end
            td do
              order.customer.first_name + ' ' + order.customer.last_name
            end
            td do
              order.customer.email
            end
            td do
              order.customer.province.name
            end
            td do
              number_to_currency(order.line_items.sum(:price))
            end
            td do
              if order.hst_rate > 0
                number_to_currency(order.line_items.sum(:price) + order.line_items.sum(:price) * order.hst_rate)
              else
                number_to_currency(order.line_items.sum(:price) +
                                    order.line_items.sum(:price) * order.gst_rate +
                                    order.line_items.sum(:price) + order.pst_rate)
              end
            end
          end
          tr do
            order.line_items.each do |item|
              td do
                item.product.name + ' ' + number_to_currency(item.price)
              end
            end
          end
        end
      end
    end
  end # content
end
