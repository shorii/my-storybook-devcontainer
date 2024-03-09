import type { Meta, StoryObj } from '@storybook/react';

import "../app/globals.css";
import Home from "../app/page";

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: 'app/page/Home',
  component: Home,
} satisfies Meta<typeof Home>;

export default meta;
type Story = StoryObj<typeof meta>;

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const Component: Story = {};