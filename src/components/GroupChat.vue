<template>
    <div class="groupChatScript" style="display: block;">
        <input type="text" id="message" placeholder="Write a message" />
        <button id="send">Send</button>

    </div>
</template>

<script>

export default{
    name: 'GroupChat'
}
</script>

<style scoped>
.groupChatScript {
    position: fixed;
    top: 50px;
    left: 200px;
    font-size: 30px;
}
</style>