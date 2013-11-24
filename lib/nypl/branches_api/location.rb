module Nypl
  module BranchesApi
    class Location < Sequel::Model(:locations)
      def contacts?
        return !(phone.nil? and fax.nil? and tty.nil? and email.nil?)
      end

      def contacts
        c = {}
        c[:phone] = phone if !phone.nil?
        c[:fax] = fax if !fax.nil?
        c[:tty] = tty if !tty.nil?
        c[:email] = email if !email.nil?
        return c
      end
    end
  end
end
