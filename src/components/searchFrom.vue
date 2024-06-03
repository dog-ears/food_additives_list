<script setup lang="ts">

// route取得
const route = useRoute();

// formの入れ物作成
const formdata = useState('formdata', () => ({
    q: route.query.q || ''
}))

// 検索ボタン押したときの処理
const submit = async () => {
    console.log(`submit() is called!!${process.server ? '(server)' : '(client)'}`);

    // フォームから空のパラメータを削除したクエリを取得する
    const query_from_formdata = {};
    Object.keys(formdata.value).forEach((key: string) => {
        if ((formdata.value as any)[key] !== '') {
            (query_from_formdata as any)[key] = (formdata.value as any)[key];
        }
    });

    // ページ遷移
    await navigateTo({
        path: '/food_additives_list/',
        query: query_from_formdata
    })
}

</script>

<template>
    <div class="search">
        <form @submit.prevent="submit">
            <input type="text" name="q" v-model="formdata.q">
            <button type="submit">検索する</button>
        </form>
    </div>
</template>