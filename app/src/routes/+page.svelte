<script lang="ts">
	export let data;
	import { Button } from '$lib/components/ui/button/index.js';
	import * as Card from '$lib/components/ui/card/index.js';
	import { Input } from '$lib/components/ui/input/index.js';
	import * as Form from '$lib/components/ui/form';

	import { formSchema } from './email-schema';
	import { superForm } from 'sveltekit-superforms';
	import { zodClient } from 'sveltekit-superforms/adapters';

	const form = superForm(data.form, {
		validators: zodClient(formSchema)
	});

	const { form: formData, enhance } = form;
</script>

<div class="flex h-screen items-center justify-center">
	<form method="POST" use:enhance>
		<Card.Root class="w-full max-w-sm">
			<Card.Header>
				<Card.Title class="text-2xl">Amazing Data Events ✨</Card.Title>
				<Card.Description>
					Sign up for our Data Events, add your email, and you will receive a calendar invite for
					all events 📆
				</Card.Description>
			</Card.Header>
			<Card.Content class="grid gap-4">
				<Form.Field {form} name="email">
					<Form.Control let:attrs>
						<Form.Label>Email</Form.Label>
						<Input {...attrs} bind:value={$formData.email} />
					</Form.Control>
					<Form.Description />
					<Form.FieldErrors />
				</Form.Field>
			</Card.Content>
			<Card.Footer>
				<Button type="submit" class="w-full">Sign up for Data Events</Button>
			</Card.Footer>
		</Card.Root>
	</form>
</div>
