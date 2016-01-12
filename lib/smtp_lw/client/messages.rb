module SmtpLw
  class Client
    module Messages

      def list_messages(status, start_date, end_date, options={})
        options = paginate(options)
        res = get "messages/", options.merge({status: status, start_date: start_date, end_date: end_date})
        res.body
      end

      def get_message(id)
        res = get "messages/#{id}"
        res.body
      end

      def send_message(subject, body, from, to, options={})
        res = post "messages", options.merge({subject: subject, body: body, from: from, to: to})
        res.body
      end


      private
      def paginate(options)
        page = options[:page] || 1
        per = options[:per] || (@per_page || SmtpLw.per_page)
        options.merge(page: page, per: per)
      end
    end
  end
end
