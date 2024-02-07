module ApplicationHelper
  def label_class
    "text-sm font-medium text-gray-900 dark:text-white"
  end

  def text_field_class
    "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def submit_class
    "w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 mt-3 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
    end

  def check_box_class
    "w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800"
    end

  def dashboard_sidebar_li_class
    "flex items-center p-2 text-white hover:text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
  end

  def thumbnail_image_tag(image_src)
    image_tag(image_src, class: "image_class")
  end

  def initials_avatar(name, size = 50)
    initials = name.split.map(&:first).join.upcase
    # color = Digest::MD5.hexdigest(name).slice(0..5)
    # color = bg-slate-600

    # content_tag(:div, initials, class: 'initials-avatar', style: "background-color: ##{color}; width: #{size}px; height: #{size}px; line-height: #{size}px;")
    content_tag(:div, initials, class: 'initials-avatar bg-slate-600', style: "width: #{size}px; height: #{size}px; line-height: #{size}px;")
  end
  def currency_formatter(amount)
    number_to_currency(amount, unit: '₦', precision: 0, delimiter: ',')
  end

  def icon_tag(icon_name, width = 25)
    image_tag(icon_name, width: width)
  end
end
