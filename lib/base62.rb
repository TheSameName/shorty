class Base62
  KEYS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = KEYS.length

  def self.encode(payload)
    return KEYS.first if payload.nil? || payload.zero?

    encoded_payload = ""

    while payload.positive?
      key = KEYS[payload % BASE]

      encoded_payload.prepend key
      payload /= BASE # payload = payload / BASE
    end

    encoded_payload
  end

  def self.decode(encoded)
    number = 0

    encoded.reverse.each_char.with_index do |char, index|
      power = BASE**index # 62^n
      index = KEYS.index(char)

      number += index * power
    end

    number
  end
end
