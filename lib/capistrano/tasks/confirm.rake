require 'colorize'

namespace :deploy do
  task :confirm do
    puts ""

    [
      "",
      "WARNING 🚨",
      "This projects dependencies are being updated automatically.",
      "Please make sure this projects' dependencies are up-to-date before deployment.",
      "",
    ].each do |line|
      puts line.center(90).red.on_light_white
    end

    puts ""

    confirmation = "yes"

    ask :answer, "If you would like to continue deployment, type #{confirmation.green}"

    if fetch(:answer) != confirmation
      puts "Halting deployment, please update your dependencies.".red
      exit
    end
  end
end
