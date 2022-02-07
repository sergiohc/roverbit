# frozen_string_literal: true

module Operations
  class MoveMarsRoversValidator < BaseValidator
    validate :file_exists?
    validate :file_lines_is_valid?

    def initialize(file)
      super
      @file = file
    end

    protected

    def file_exists?
      return true if File.exist?(@file)

      errors.add(:errors, message: 'Arquivo não encontrado')
      false
    end

    def file_lines_is_valid?
      return true unless File.exist?(@file) && File.open(@file).each_line.count < 3

      errors.add(:errors,
                 message: 'A configuração do arquivo não é valida, o arquivo precisa no mínimo de 3 linhas de instrução.')
      false
    end
  end
end
