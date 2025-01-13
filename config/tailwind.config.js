const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/assets/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./config/initializers/*.rb",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        luckiest: ["Luckiest Guy", "cursive"],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("daisyui"),
  ],
  daisyui: {
    themes: ["coffee", "halloween"],
  },
  watchOptions: {
    ignored: ["**/node_modules/**"],
  },
};
