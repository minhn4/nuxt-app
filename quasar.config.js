module.exports = function (ctx) {
  return {
    extras: ["material-icons"],
    framework: {
      plugins: ["LocalStorage", "SessionStorage"],
      config: {
        dark: "auto",
      },
    },
  };
};
