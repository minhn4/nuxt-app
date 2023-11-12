<script>
import UserProfile from "./components/buttons/UserProfile.vue";
import DarkModeSwitcher from "./components/buttons/DarkModeSwitcher.vue";

export default {
  components: {
    UserProfile,
    DarkModeSwitcher,
  },
};
</script>

<template>
  <div>
    <UserProfile />
    <DarkModeSwitcher />
    <p>Testing text</p>
  </div>
</template>
