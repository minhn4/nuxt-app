<script>
import UserProfile from "./components/buttons/UserProfile.vue";
import DarkModeToggle from "./components/buttons/DarkModeToggle.vue";

export default {
  components: {
    UserProfile,
    DarkModeToggle,
  },
};
</script>

<template>
  <div>
    <UserProfile />
    <DarkModeToggle />
    <p>Testing text</p>
  </div>
</template>
