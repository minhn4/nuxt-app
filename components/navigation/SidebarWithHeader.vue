<template>
  <div class="q-pa-md">
    <q-layout
      view="lHh Lpr lff"
      container
      style="height: 700px"
      class="shadow-2 rounded-borders"
    >
      <q-header elevated class="bg-cyan-8">
        <q-toolbar>
          <q-toolbar-title>Header</q-toolbar-title>
          <q-btn flat round dense icon="menu" @click="drawer = !drawer" />
        </q-toolbar>
      </q-header>

      <q-drawer v-model="drawer" show-if-above :width="200" :breakpoint="400">
        <q-scroll-area
          style="
            height: calc(100% - 150px);
            margin-top: 150px;
            border-right: 1px solid #ddd;
          "
        >
          <q-list padding>
            <q-item v-ripple href="/inbox" clickable>
              <q-item-section avatar>
                <q-icon name="inbox" />
              </q-item-section>

              <q-item-section> Inbox </q-item-section>
            </q-item>

            <q-item
              v-ripple
              active
              href="https://github.com/"
              target="_blank"
              rel="noopener noreferrer"
              clickable
            >
              <q-item-section avatar>
                <q-icon name="star" />
              </q-item-section>

              <q-item-section> Star </q-item-section>
            </q-item>

            <q-item v-ripple href="/about" clickable>
              <q-item-section avatar>
                <q-icon name="send" />
              </q-item-section>

              <q-item-section> Send </q-item-section>
            </q-item>

            <q-item v-ripple href="/" clickable>
              <q-item-section avatar>
                <q-icon name="drafts" />
              </q-item-section>

              <q-item-section> Drafts </q-item-section>
            </q-item>
          </q-list>
        </q-scroll-area>

        <q-img
          class="absolute-top"
          src="https://cdn.quasar.dev/img/material.png"
          style="height: 150px"
        >
          <div class="absolute-bottom bg-transparent">
            <q-avatar size="56px" class="q-mb-sm">
              <img src="https://cdn.quasar.dev/img/boy-avatar.png" />
            </q-avatar>
            <div class="text-weight-bold">Razvan Stoenescu</div>
            <div>@rstoenescu</div>
          </div>
        </q-img>
      </q-drawer>

      <q-page-container>
        <q-page padding>
          <p>Hello</p>
        </q-page>
      </q-page-container>
    </q-layout>
  </div>
</template>

<script>
export default {
  setup() {
    return {
      drawer: ref(false),
    };
  },
};
</script>
