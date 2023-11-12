<script>
export default defineComponent({
  setup() {
    const darkMode = ref(false);
    const $q = useQuasar();

    watch(darkMode, (darkMode) => {
      $q.dark.set(darkMode);
    });

    return {
      darkMode,
    };
  },
});
</script>

<template>
  <q-toggle
    v-model="darkMode"
    checked-icon="dark_mode"
    color="red"
    size="lg"
    unchecked-icon="light_mode"
  />
</template>
