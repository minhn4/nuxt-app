<template>
  <div>
    <SidebarWithHeader />
    <DarkModeToggle />
    <UserProfile />
    <ul>
      <li><NuxtLink to="/inbox">Inbox</NuxtLink></li>
      <li><NuxtLink to="/about">About</NuxtLink></li>
    </ul>
    <NuxtPage />
  </div>
</template>

<script>
import SidebarWithHeader from "./components/navigation/SidebarWithHeader.vue";
import DarkModeToggle from "./components/buttons/DarkModeToggle.vue";
import UserProfile from "./components/buttons/UserProfile.vue";

export default {
  components: {
    SidebarWithHeader,
    DarkModeToggle,
    UserProfile,
  },
};
</script>
