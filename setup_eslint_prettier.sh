#!/bin/bash

# 此脚本用于在使用vite创建的vue-ts项目中初始化ESLint与Prettier

pnpm install -D @typescript-eslint/eslint-plugin @typescript-eslint/parser @vitejs/plugin-vue eslint eslint-config-prettier eslint-plugin-html eslint-plugin-prettier eslint-plugin-vue prettier

cat >.eslintrc.json <<EOF
{
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:vue/vue3-essential",
    "plugin:@typescript-eslint/recommended",
    "plugin:vue/vue3-recommended",
    "plugin:prettier/recommended"
  ],
  "overrides": [],
  "parser": "vue-eslint-parser",
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module",
    "parser": "@typescript-eslint/parser"
  },
  "plugins": ["vue", "@typescript-eslint", "html"],
  "rules": {}
}
EOF

cat >.prettierrc.cjs <<EOF
module.exports = {
  printWidth: 120,
  tabWidth: 2,
  useTabs: false,
  semi: false,
  singleQuote: true,
  quoteProps: 'consistent',
  jsxSingleQuote: true,
  trailingComma: 'es5',
  bracketSpacing: true,
  jsxBracketSameLine: true,
  arrowParens: 'avoid',
  requirePragma: false,
  insertPragma: false,
  proseWrap: 'preserve',
  htmlWhitespaceSensitivity: 'ignore',
  vueIndentScriptAndStyle: true,
  endOfLine: 'lf',
  embeddedLanguageFormatting: 'auto',
}
/**
 * 配置参考
 * http://www.yulilong.cn/doc/tool/004-prettier%E4%BB%A3%E7%A0%81%E6%A0%BC%E5%BC%8F%E5%8C%96%E5%B7%A5%E5%85%B7.html#_1-%E9%85%8D%E7%BD%AE
 * https://juejin.cn/post/7013281180019589134
 */
EOF

cat >.vscode/.settings.json <<EOF
{
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
EOF
